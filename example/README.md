Slideshow service example in Perl5
==================================

This Perl 5 web service sends random Wiki(pedia) article titles and URLs and as
Server Side Events (SSE). The MediaWiki instance and delay can be configured. 

Install required Perl modules to `local` subdirectory:

    cpanm --installdeps -l local --skip-satisfied .

Run example application on port 5000:

    plackup -Ilocal/lib/perl5

