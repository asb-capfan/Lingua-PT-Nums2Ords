package Lingua::PT::Nums2Ords;

use 5.006;
use strict;
use warnings;

use Lingua::PT::Nums2Words qw/num2word/;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	num2ord
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);

our $VERSION = '0.08';

=head1 NAME

Lingua::PT::Nums2Ords - Converts numbers to Portuguese ordinals

=head1 SYNOPSIS

  use Lingua::PT::Nums2Ords qw/num2ord/;

  $ord = num2ord(20)     # "vigesimo"

  @ord = num2ord(1,2,3)  # qw(primeiro segundo terceiro)

=head1 DESCRIPTION

Converts numbers to Portuguese ordinals. Works up to 999.999.999.999
('novecentos e noventa e nove bilionesimos novecentos e noventa e
nove milionesimos novecentos e noventa e nove milesimos nongentesimo
nonagesimo nono').

=head2 num2ord

This is the only function in the module. It turns a number into an
ordinal.

  $ord = num2ord(2)
  # $ord now holds "segundo"

=cut

sub num2ord {
  @_ || return ();
  my @numbers = wantarray ? @_ : shift;
  my @results = map {
    $_ < 0 && return $_;
    $_ > 999999999999 && return $_;

    s/(?<!\d)1(?=\d{9}$)/bilion�simo /;
    s/(\d{1,3})(?=\d{9})/num2word($1).' bilion�simos '/e;

    s/(?<!\d)0+//;

    s/(?<!\d)1(?=\d{6}$)/milion�simo /;
    s/(\d{1,3})(?=\d{6})/num2word($1).' milion�simos '/e;

    s/(?<!\d)0+//;

    s/(?<!\d)1(?=\d{3}$)/mil�simo /;
    s/(\d{1,3})(?=\d{3})/num2word($1).' mil�simos '/e;

    s/(?<!\d)0//;

    s/9(?=\d\d)/nongent�simo /;
    s/8(?=\d\d)/octigent�simo /;
    s/7(?=\d\d)/septigent�simo /;
    s/6(?=\d\d)/seiscent�simo /;
    s/5(?=\d\d)/quingent�simo /;
    s/4(?=\d\d)/quadrigent�simo /;
    s/3(?=\d\d)/tricent�simo /;
    s/2(?=\d\d)/ducent�simo /;
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

=head1 DEPENDENCIES

Lingua::PT::Nums2Words

=head1 SEE ALSO

More tools for the Portuguese language processing can be found at the
Natura project: L<http://natura.di.uminho.pt>

=head1 AUTHOR

Jose Castro, C<< <cog@cpan.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2004 Jose Castro, All Rights Reserved.

This program is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
