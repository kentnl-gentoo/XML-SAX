# $Id$

package XML::SAX::PurePerl::Reader::String;

use strict;
use vars qw(@ISA);

use XML::SAX::PurePerl::Reader;

@ISA = ('XML::SAX::PurePerl::Reader');

sub new {
    my $class = shift;
    my $string = shift;
    return bless { 
                string => $string, 
                line => 1, 
                col => 0, 
                buffer => '',
                discarded => '',
        }, $class;
}

sub next {
    my $self = shift;
    
    $self->{discarded} .= $self->{current} if defined $self->{current};
    
    # check for chars in buffer first.
    if (length($self->{buffer})) {
        return $self->{current} = substr($self->{buffer}, 0, 1, ''); # last param truncates buffer
    }
    
    $self->{current} = substr($self->{string}, 0, 1, '');
}

sub set_encoding {
    my $self = shift;
    my ($encoding) = @_;

    XML::SAX::PurePerl::Reader::switch_encoding_string($self->{string}, $encoding, "utf-8");
    $self->{encoding} = $encoding;
}

sub bytepos {
    my $self = shift;
    length($self->{discarded});
}

sub eof {
    my $self = shift;
    return !length($self->{string});
}


1;
