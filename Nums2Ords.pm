package Lingua::PT::Nums2Ords;

use 5.006;
use strict;
use warnings;

use Lingua::PT::Nums2Words;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	num2ord
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	num2ord
);

our $VERSION = '0.05';

=head1 NAME

Lingua::PT::Nums2Ords - Converts numbers to Portuguese ordinals

=head1 SYNOPSIS

  use Lingua::PT::Nums2Ords;

  $ord = num2ord(20)     # "vigesimo"

  @ord = num2ord(1,2,3)  # qw(primeiro segundo terceiro)

=cut

sub num2ord {
  @_ || return ();
  my @numbers = wantarray ? @_ : shift;
  my @results = map {
    $_ < 0 && return $_;
    $_ > 999999999999 && return $_;

    s/(?<!\d)1(?=\d{9}$)/bilionésimo /;
    s/(\d{1,3})(?=\d{9})/num2word($1).' bilionésimos '/e;

    s/(?<!\d)0+//;

    s/(?<!\d)1(?=\d{6}$)/milionésimo /;
    s/(\d{1,3})(?=\d{6})/num2word($1).' milionésimos '/e;

    s/(?<!\d)0+//;

    s/(?<!\d)1(?=\d{3}$)/milésimo /;
    s/(\d{1,3})(?=\d{3})/num2word($1).' milésimos '/e;

    s/(?<!\d)0//;

    s/9(?=\d\d)/nongentésimo /;
    s/8(?=\d\d)/octigentésimo /;
    s/7(?=\d\d)/septigentésimo /;
    s/6(?=\d\d)/seiscentésimo /;
    s/5(?=\d\d)/quingentésimo /;
    s/4(?=\d\d)/quadrigentésimo /;
    s/3(?=\d\d)/tricentésimo /;
    s/2(?=\d\d)/ducentésimo /;
    s/1(?=\d\d)/centésimo /;

    s/(?<!\d)0//;

    s/9(?=\d)/nonagésimo /;
    s/8(?=\d)/octogésimo /;
    s/7(?=\d)/septuagésimo /;
    s/6(?=\d)/sexagésimo /;
    s/5(?=\d)/quinquagésimo /;
    s/4(?=\d)/quadragésimo /;
    s/3(?=\d)/trigésimo /;
    s/2(?=\d)/vigésimo /;
    s/1(?=\d)/décimo /;

    s/(?<!\d)0//;

    s/9/nono/;
    s/8/oitavo/;
    s/7/sétimo/;
    s/6/sexto/;
    s/5/quinto/;
    s/4/quarto/;
    s/3/terceiro/;
    s/2/segundo/;
    s/1/primeiro/;

    s/ +$//;

    $_;
  } @numbers;

  return wantarray ? @numbers : $numbers[0];
}

1;
__END__

=head1 DESCRIPTION

Converts numbers to Portuguese ordinals. Works up to 999.999.999.999
('novecentos e noventa e nove bilionesimos novecentos e noventa e
nove milionesimos novecentos e noventa e nove milesimos nongentesimo
nonagesimo nono').

=head1 DEPENDENCIES

Lingua::PT::Nums2Words

=head1 SEE ALSO

Lingua::PT::Ords2Nums

=head1 MESSAGE FROM THE AUTHOR

If you're using this module, please drop me a line to my e-mail. Tell
me what you're doing with it. Also, feel free to suggest new
bugs^H^H^H^H^H features.

=head1 AUTHOR

Jose Alves de Castro, E<lt>cog [at] cpan [dot] org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Jose Alves de Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
