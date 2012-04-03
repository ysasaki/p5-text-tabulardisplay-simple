use 5.008008;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'Text::TabularDisplay::Simple',
    VERSION_FROM => 'lib/Text/TabularDisplay/Simple.pm',
    PREREQ_PM    => {
        'parent'               => 0,
        'Text::TabularDisplay' => '1.30',
    },
    ABSTRACT_FROM => 'lib/Text/TabularDisplay/Simple.pm',
    AUTHOR        => 'Yoshihiro Sasaki <ysasaki at cpan.org>',
    LICENSE       => 'perl',
    META_MERGE    => {
        resources => {
            license    => 'http://dev.perl.org/licenses/',
            bugtracker => 'https://github.com/ysasaki/p5-text-tabulardisplay-simple/issues',
            repository => 'git://github.com/ysasaki/p5-text-tabulardisplay-simple.git',
        },
    },
);
