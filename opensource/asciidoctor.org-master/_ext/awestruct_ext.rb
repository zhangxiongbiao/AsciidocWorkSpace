require 'asciidoctor'
require 'asciidoctor/extensions'

Asciidoctor::Extensions.register do
  # workaround for Awestruct 0.5.5
  # (change lib/awestruct/handlers/asciidoctor_handler.rb, line 108 to opts[:base_dir] = @site.config.dir unless opts.key? :base_dir)
  if (docfile = @document.attributes['docfile'])
    @document.instance_variable_set :@base_dir, File.dirname(docfile)
  end

  unless ::Awestruct::Engine.instance.development?
    postprocessor {
      process {|doc, output|
        next output if (doc.attr? 'page-layout') || !(doc.attr? 'site-google_analytics_account')
        account_id = doc.attr 'site-google_analytics_account'
        %(#{output.rstrip.chomp('</html>').rstrip.chomp('</body>').chomp}
<script>
!function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m);}(window,document,'script','//www.google-analytics.com/analytics.js','ga'),ga('create','#{account_id}','auto'),ga('send','pageview');
</script>
</body>
</html>)
    }
  }
  end
end

module Awestruct
  class Engine
    def development?
      site.profile == 'development'
    end
  end
end
