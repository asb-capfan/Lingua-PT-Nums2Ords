# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 19;
BEGIN { use_ok('Lingua::PT::Nums2Ords') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

is(num2ord(1),'primeiro');
is(num2ord(2),'segundo');
is(num2ord(3),'terceiro');
is(num2ord(4),'quarto');
is(num2ord(5),'quinto');
is(num2ord(6),'sexto');
is(num2ord(7),'s�timo');
is(num2ord(8),'oitavo');
is(num2ord(9),'nono');

is(num2ord(10),'d�cimo');
is(num2ord(11),'d�cimo primeiro');

is(num2ord(30),'trig�simo');
is(num2ord(33),'trig�simo terceiro');
is(num2ord(70),'septuag�simo');

is(num2ord(101),'cent�simo primeiro');
is(num2ord(150),'cent�simo quinquag�simo');
is(num2ord(199),'cent�simo nonag�simo nono');

TODO: {

local $TODO = "support for bigger numbers";

is(num2ord(1000),'mil�simo');

}
