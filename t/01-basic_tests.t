# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl 1.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 50;
BEGIN { use_ok('Lingua::PT::Nums2Ords', 'num2ord') };

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
is(num2ord(299),'ducent�simo nonag�simo nono');
is(num2ord(301),'tricent�simo primeiro');
is(num2ord(421),'quadrigent�simo vig�simo primeiro');
is(num2ord(520),'quingent�simo vig�simo');
is(num2ord(622),'seiscent�simo vig�simo segundo');
is(num2ord(700),'septigent�simo');
is(num2ord(855),'octigent�simo quinquag�simo quinto');
is(num2ord(988),'nongent�simo octog�simo oitavo');

is(num2ord(1000),'mil�simo');
is(num2ord(10000),'dez mil�simos');
is(num2ord(11000),'onze mil�simos');
is(num2ord(10090),'dez mil�simos nonag�simo');
is(num2ord(100000),'cem mil�simos');
is(num2ord(300000),'trezentos mil�simos');
is(num2ord(321987),'trezentos e vinte e um mil�simos nongent�simo octog�simo s�timo');
is(num2ord(444444),'quatrocentos e quarenta e quatro mil�simos quadrigent�simo quadrag�simo quarto');
is(num2ord(987654),'novecentos e oitenta e sete mil�simos seiscent�simo quinquag�simo quarto');

is(num2ord(1000000),'milion�simo');
is(num2ord(1000001),'milion�simo primeiro');
is(num2ord(1001001),'milion�simo mil�simo primeiro');
is(num2ord(2000000),'dois milion�simos');
is(num2ord(999999999),'novecentos e noventa e nove milion�simos novecentos e noventa e nove mil�simos nongent�simo nonag�simo nono');

is(num2ord(1000000000),'bilion�simo');
is(num2ord(1000000001),'bilion�simo primeiro');
is(num2ord(2000000000),'dois bilion�simos');
is(num2ord(2000002000),'dois bilion�simos dois mil�simos');
is(num2ord(3002001000),'tr�s bilion�simos dois milion�simos mil�simo');
is(num2ord(3002001009),'tr�s bilion�simos dois milion�simos mil�simo nono');
is(num2ord(9090909090),'nove bilion�simos noventa milion�simos novecentos e nove mil�simos nonag�simo');
is(num2ord(8808080808),'oito bilion�simos oitocentos e oito milion�simos oitenta mil�simos octigent�simo oitavo');
is(num2ord(7654321987),'sete bilion�simos seiscentos e cinquenta e quatro milion�simos trezentos e vinte e um mil�simos nongent�simo octog�simo s�timo');
is(num2ord(999999999999),'novecentos e noventa e nove bilion�simos novecentos e noventa e nove milion�simos novecentos e noventa e nove mil�simos nongent�simo nonag�simo nono');
