package Lingua::PT::Nums2Ords;

use 5.008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	num2ord
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	num2ord
);

our $VERSION = '0.01';

=head1 NAME

Lingua::PT::Nums2Ords - Converts numbers to Portuguese ordinals

=head1 SYNOPSIS

  use Lingua::PT::Nums2Ords;

  $ord = num2ord(20)     # "vig�simo"

  @ord = num2ord(1,2,3)  # qw(primeiro segundo terceiro)

=cut

sub num2ord {
  @_ || return ();
  my @numbers = wantarray ? @_ : shift;
  my @results = map {
    $_ < 0 && return $_;
    $_ > 199 && return $_;

    s/1(?=\d\d)/cent�simo /;

    s/(?<!\d)0//;

    s/9(?=\d)/nonag�simo /;
    s/8(?=\d)/octog�simo /;
    s/7(?=\d)/septuag�simo /;
    s/6(?=\d)/sexag�simo /;
    s/5(?=\d)/quinquag�simo /;
    s/4(?=\d)/quadrag�simo /;
    s/3(?=\d)/trig�simo /;
    s/2(?=\d)/vig�simo /;
    s/1(?=\d)/d�cimo /;

    s/(?<!\d)0//;

    s/9/nono/;
    s/8/oitavo/;
    s/7/s�timo/;
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

Converts numbers to Portuguese ordinals. Still needs further testing and
capability.

=head1 SEE ALSO

Lingua::PT::Ords2Nums

=head1 AUTHOR

Jose Alves de Castro, E<lt>jac@localdomainE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Jose Alves de Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
