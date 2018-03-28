use ExtUtils::MakeMaker;
use File::Basename ();
use File::Spec ();


WriteMakefile(
    'NAME'	=> 'XML::SAX',
    'VERSION_FROM' => 'SAX.pm', # finds $VERSION
    'PREREQ_PM' => { 
        'File::Temp' => 0,
        'XML::SAX::Base' => 1.05,
        'XML::NamespaceSupport' => 0.03,
    },    
);
