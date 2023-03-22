#!/usr/bin/perl
use strict;
use warnings;

# Biblioteca GTK (interface grafica)
use Gtk3 -init;

# Para usar UTF8 na janela
use Encode qw(encode decode);

# Cria a janela com titulo, posicao, tamanho e largura
my $window = Gtk3::Window->new('toplevel');
$window->set_title('Calcular IMC');
$window->set_position('center');
$window->set_default_size(800, 50);

# https://github.com/kevinphilp/Perl-gtk3-Tutorial/blob/master/6a-Checkbox-Basics.pl
# Exemplo retirado de um trecho do codigo do programador Kevin Philip
my $vbox = Gtk3::Box->new('vertical', 5);
$vbox->set_homogeneous(0);
$window->add($vbox);
my $resultado_label = Gtk3::Label->new('');
$vbox->add($resultado_label);
# Mostra todos os widgets
$window->show_all();

print "Informe a sua altura: ";
my $altura = <STDIN>;
print "Informe o seu peso: ";
my $peso = <STDIN>;

# Formula para calcular o IMC
my $imc = $peso / ($altura * $altura);

# Tabela IMC
# < 18.5 abaixo do peso
# >= 18.5 <= 24.9 peso normal
# >= 30.0 <= 34.9 obesidade 1
# >= 35.0 <= 39.9 obesidade 2
# >= 40.0 obesidade 3

if($imc < 18.5) {
    print "Seu IMC é considerado: Abaixo do peso";
} elsif($imc >= 18.5 and $imc <= 24.9) {
    print "Seu IMC é considerado: peso normal";
} elsif($imc >= 30.0 and $imc <= 34.9) {
    print "Seu IMC é considerado: Obesidade Grau I";
} elsif($imc >= 35.0 and $imc <= 39.9) {
    print "Seu IMC é considerado: Obesidade Grau II";
} else {
    print "Seu IMC é considerado: Obesidade Grau III";
}

if($imc < 18.5) {
    $resultado_label->set_text(decode('utf8', "Seu IMC é considerado: Abaixo do peso"));
} elsif($imc >= 18.5 and $imc <= 24.9) {
    $resultado_label->set_text(decode('utf8', "Seu IMC é considerado: peso normal"));
} elsif($imc >= 30.0 and $imc <= 34.9) {
    $resultado_label->set_text(decode('utf8',"Seu IMC é considerado: Obesidade Grau I"));
} elsif($imc >= 35.0 and $imc <= 39.9) {
    $resultado_label->set_text(decode('utf8',"Seu IMC é considerado: Obesidade Grau II"));
} else {
    $resultado_label->set_text(decode('utf8',"Seu IMC é considerado: Obesidade Grau III"));
}

# Inicia a tela grafica
Gtk3->main();