
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Generate some stuff via introspection',
  'AUTHOR' => 'Dave Houston <dhouston@cpan.org>',
  'BUILD_REQUIRES' => {
    'Data::Dumper' => '0',
    'PPI' => '0',
    'Pod::Weaver' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'Pod-Weaver-Section-ClassMopper',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Pod::Weaver::Section::ClassMopper',
  'PREREQ_PM' => {
    'Class::Load' => '0',
    'List::Util' => '0',
    'Moose' => '0',
    'Moose::Util::TypeConstraints' => '0',
    'Pod::Elemental::Element::Nested' => '0',
    'Pod::Elemental::Element::Pod5::Command' => '0',
    'Pod::Elemental::Element::Pod5::Ordinary' => '0',
    'Pod::Weaver::Role::Section' => '0'
  },
  'VERSION' => '1.120100',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



