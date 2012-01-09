require 'java'

require 'rubygems'
require 'facets/hash'

require 'swt'

require 'lib/log4j/log4j-1.2.16.jar'
require 'log4jruby'
require 'log4jruby/logger_for_class'
logger = Log4jruby::Logger.get('test', :tracing => true, :level => :debug )
logger.debug("Shoooes!")

require 'shoes/app'
require 'shoes/element_methods'
require 'shoes/layout'
require 'shoes/native'
require 'shoes/window'
require 'shoes/flow'
require 'shoes/button'
require 'shoes/animation'

#require 'shoes/elements/element'
#require 'shoes/elements/button'
#require 'shoes/elements/stack'
#require 'shoes/elements/flow'
#require 'shoes/elements/edit_line'
#require 'shoes/elements/edit_box'
#require 'shoes/elements/check'
#require 'shoes/elements/image'

module Shoes

  include Log4jruby::LoggerForClass

  def self.app(opts={}, &blk)
    Shoes::App.new(opts, &blk)
    logger.debug "Exiting Shoes.app"
  end

=begin
  def self.manual_link(sect)
  end

  TITLES = {:title => :h1, :subtitle => :h2, :tagline => :h3, :caption => :h4}

  def self.manual_as format, *args
    require 'shoes/search'
    require 'shoes/help'

    case format
    when :shoes
      Shoes.app(:width => 720, :height => 640, &Shoes::Help)
    else
      extend Shoes::Manual
      man = self
      dir, = args
      FileUtils.mkdir_p File.join(dir, 'static')
      FileUtils.cp "#{DIR}/static/shoes-icon.png", "#{dir}/static"
      %w[manual.css code_highlighter.js code_highlighter_ruby.js].
        each { |x| FileUtils.cp "#{DIR}/static/#{x}", "#{dir}/static" }
      html_bits = proc do
        proc do |sym, text|
        case sym when :intro
          div.intro { p { self << man.manual_p(text, dir) } }
        when :code
          pre { code.rb text.gsub(/^\s*?\n/, '') }
        when :colors
          color_names = (Shoes::COLORS.keys*"\n").split("\n").sort
          color_names.each do |color|
            c = Shoes::COLORS[color.intern]
            f = c.dark? ? "white" : "black"
            div.color(:style => "background: #{c}; color: #{f}") { h3 color; p c }
          end
        when :index
          tree = man.class_tree
          shown = []
          i = 0
          index_p = proc do |k, subs|
            unless shown.include? k
              i += 1
              p "▸ #{k}", :style => "margin-left: #{20*i}px"
              subs.uniq.sort.each do |s|
                index_p[s, tree[s]]
              end if subs
              i -= 1
              shown << k
            end
          end
          tree.sort.each &index_p
        #   index_page
        when :list
          ul { text.each { |x| li { self << man.manual_p(x, dir) } } }
        when :samples
          folder = File.join DIR, 'samples'
          h = {}
          Dir.glob(File.join folder, '*').each do |file|
            if File.extname(file) == '.rb'
              key = File.basename(file).split('-')[0]
              h[key] ? h[key].push(file) : h[key] = [file]
            end
          end
          h.each do |k, v|
            p "<h4>#{k}</h4>"
            samples = []
            v.each do |file|
              sample = File.basename(file).split('-')[1..-1].join('-')[0..-4]
              samples << "<a href=\"http://github.com/shoes/shoes/raw/master/manual-snapshots/#{k}-#{sample}.png\">#{sample}</a>"
            end
            p samples.join ' '
          end
        else
          send(TITLES[sym] || :p) { self << man.manual_p(text, dir) }
        end
        end
      end

      docs = load_docs(Shoes::Manual::path)
      sections = docs.map { |x,| x }

      docn = 1
      docs.each do |title1, opt1|
        subsect = opt1['sections'].map { |x,| x }
        menu = sections.map do |x|
          [x, (subsect if x == title1)]
        end

        path1 = File.join(dir, title1.gsub(/\W/, ''))
        make_html("#{path1}.html", title1, menu) do
          h2 "The Shoes Manual"
          h1 title1
          man.wiki_tokens opt1['description'], true, &instance_eval(&html_bits)
          p.next { text "Next: "
            a opt1['sections'].first[1]['title'], :href => "#{opt1['sections'].first[0]}.html" }
        end

        optn = 1
        opt1['sections'].each do |title2, opt2|
          path2 = File.join(dir, title2)
          make_html("#{path2}.html", opt2['title'], menu) do
            h2 "The Shoes Manual"
            h1 opt2['title']
            man.wiki_tokens opt2['description'], true, &instance_eval(&html_bits)
            opt2['methods'].each do |title3, desc3|
              sig, val = title3.split(/\s+»\s+/, 2)
              aname = sig[/^[^(=]+=?/].gsub(/\s/, '').downcase
              a :name => aname
              div.method do
                a sig, :href => "##{aname}"
                text " » #{val}" if val
              end
              div.sample do
                man.wiki_tokens desc3, &instance_eval(&html_bits)
              end
            end
            if opt1['sections'][optn]
              p.next { text "Next: "
                a opt1['sections'][optn][1]['title'], :href => "#{opt1['sections'][optn][0]}.html" }
            elsif docs[docn]
              p.next { text "Next: "
                a docs[docn][0], :href => "#{docs[docn][0].gsub(/\W/, '')}.html" }
            end
            optn += 1
          end
        end

        docn += 1
      end
    end
  end

  def self.show_manual
    manual_as :shoes
  end

  def self.show_log
    require 'shoes/log'
    return if @log_app and Shoes.APPS.include? @log_app
    @log_app =
      Shoes.app do
        extend Shoes::LogWindow
        setup
      end
  end

  def self.mount(path, meth, &blk)
    @mounts << [path, meth || blk]
  end

  SHOES_URL_RE = %r!^@([^/]+)(.*)$! 

  def self.run(path)
    uri = URI(path)
    @mounts.each do |mpath, rout|
      m, *args = *path.match(/^#{mpath}$/)
      if m
        unless rout.is_a? Proc
          rout = rout[0].instance_method(rout[1])
        end
        return [rout, args]
      end
    end
    case uri.path when "/"
      [nil]
    when SHOES_URL_RE
      [proc { eval(URI("http://#$1:53045#$2").read) }]
    else
      [NotFound]
    end
  end

  def self.args!
    if RUBY_PLATFORM !~ /darwin/ and ARGV.empty?
      Shoes.splash
    end
    OPTS.parse! ARGV
    ARGV[0] or true
  end

  def self.uri(str)
    if str =~ SHOES_URL_RE
      URI("http://#$1:53045#$2")
    else
      URI(str) rescue nil
    end
  end

  def self.visit(path)
    uri = Shoes.uri(path)

    case uri
    when URI::HTTP
      str = uri.read
      if str !~ /Shoes\.app/
        Shoes.app do
          eval(uri.read)
        end
      else
        eval(uri.read)
      end
    else
      path = File.expand_path(path.gsub(/\\/, "/"))
      if path =~ /\.shy$/
        @shy = true
        require 'shoes/shy'
        base = File.basename(path, ".shy")
        tmpdir = "%s/shoes-%s.%d" % [Dir.tmpdir, base, $$]
        shy = Shy.x(path, tmpdir)
        Dir.chdir(tmpdir)
        Shoes.debug "Loaded SHY: #{shy.name} #{shy.version} by #{shy.creator}"
        path = shy.launch
      else
        @shy = false
        Dir.chdir(File.dirname(path))
        path = File.basename(path)
      end

      $0.replace path
      
      code = read_file(path)
      eval(code, TOPLEVEL_BINDING, path)
    end
  rescue SettingUp
  rescue Object => e
    error(e)
    show_log
  end

  def self.read_file path
    if RUBY_VERSION =~ /^1\.9/ and !@shy
      #File.open(path, 'r:utf-8') { |f| f.read }
      IO.read(path).force_encoding("UTF-8")
    else
      File.read(path)
    end
  end

  def self.url(path, meth)
    Shoes.mount(path, [self, meth])
  end

  module Basic
    def tween opts, &blk
      opts = opts.dup

      if opts[:upward]
        opts[:top] = self.top - opts.delete(:upward)
      elsif opts[:downward]
        opts[:top] = self.top + opts.delete(:downward)
      end
      
      if opts[:sideways]
        opts[:left] = self.left + opts.delete(:sideways)
      end
      
      @TWEEN.remove if @TWEEN
      @TWEEN = parent.animate(opts[:speed] || 20) do

        # figure out a coordinate halfway between here and there
        cont = opts.select do |k, v|
          if self.respond_to? k
            n, o = v, self.send(k)
            if n != o
              n = o + ((n - o) / 2)
              n = v if o == n
              self.send("#{k}=", n)
            end
            self.style[k] != v
          end
        end

        # if we're there, get rid of the animation
        if cont.empty?
          @TWEEN.remove
          @TWEEN = nil
          blk.call if blk
        end
      end
    end
  end

  # complete list of styles
  BASIC_S = [:left, :top, :right, :bottom, :width, :height, :attach, :hidden,
             :displace_left, :displace_top, :margin, :margin_left, :margin_top,
             :margin_right, :margin_bottom]
  TEXT_S  = [:strikecolor, :undercolor, :font, :size, :family, :weight,
             :rise, :kerning, :emphasis, :strikethrough, :stretch, :underline,
             :variant]
  MOUSE_S = [:click, :motion, :release, :hover, :leave]
  KEY_S   = [:keydown, :keypress, :keyup]
  COLOR_S = [:stroke, :fill]

  {Background => [:angle, :radius, :curve, *BASIC_S],
   Border     => [:angle, :radius, :curve, :strokewidth, *BASIC_S],
   Canvas     => [:scroll, :start, :finish, *(KEY_S|MOUSE_S|BASIC_S)],
   Check      => [:click, :checked, *BASIC_S],
   Radio      => [:click, :checked, :group, *BASIC_S],
   EditLine   => [:change, :secret, :text, *BASIC_S],
   EditBox    => [:change, :text, *BASIC_S],
   Effect     => [:radius, :distance, :inner, *(COLOR_S|BASIC_S)],
   Image      => MOUSE_S|BASIC_S,
   ListBox    => [:change, :items, :choose, *BASIC_S],
   # Pattern    => [:angle, :radius, *BASIC_S],
   Progress   => BASIC_S,
   Shape      => COLOR_S|MOUSE_S|BASIC_S,
   TextBlock  => [:justify, :align, :leading, *(COLOR_S|MOUSE_S|TEXT_S|BASIC_S)],
   Text       => COLOR_S|MOUSE_S|TEXT_S|BASIC_S}.
  each do |klass, styles|
    klass.class_eval do
      include Basic
      styles.each do |m|
        case m when *MOUSE_S
        else
          define_method(m) { style[m] } unless klass.method_defined? m
          define_method("#{m}=") { |v| style(m => v) } unless klass.method_defined? "#{m}="
        end
      end
    end
  end

  class Types::Widget
    @@types = {}
    def self.inherited subc
      methc = subc.to_s[/(^|::)(\w+)$/, 2].
              gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
              gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
      @@types[methc] = subc
      Shoes.class_eval %{
        def #{methc}(*a, &b)
          a.unshift Widget.class_variable_get("@@types")[#{methc.dump}]
          widget(*a, &b)
        end
      }
    end
  end
=end

end

def window(*a, &b)
  Shoes.app(*a, &b)
end
