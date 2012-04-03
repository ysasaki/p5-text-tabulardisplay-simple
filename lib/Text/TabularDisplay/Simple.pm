package Text::TabularDisplay::Simple;
use strict;
use warnings;
use Text::TabularDisplay;
use Carp ();
use parent 'Exporter';

our $VERSION = '0.01';
our @EXPORT_OK = qw/to_table/;

sub to_table {
    my ( $data, $columns ) = @_;
    if ( ref $data eq 'ARRAY' ) {
        my $table = _t(@$columns);
        for my $hash (@$data) {
            $table->add( map { $hash->{$_} } @$columns );
        }
        return $table;
    }
    elsif ( ref $data eq 'HASH' ) {
        my $table = _t(qw/Key Value/);
        for my $key (@$columns) {
            $table->add( $key, $data->{$key} );
        }
        return $table;
    }
    else {
        Carp::croak
            "first argument of to_table must be hash or arrayref of hashref";
    }
}

sub _t {
    Text::TabularDisplay->new(@_);
}

=head1 NAME

Text::TabularDisplay::Simple - Very simple wrapper for Text::TabularDisplay

=head1 SYNOPSIS

  use Text::TabularDisplay::Simple qw(to_table);

  {
      # arrayref of hashref for data
      my $data = [
          { id => 1, name => 'foo', password => 'secret' },
          { id => 2, name => 'bar'  password => 'xxxxxx' },
      ];
      my $columns = [qw/id name/];
      my $table = to_table($data, $columns); # return Text::TabularDisplay object
      print $table->render, "\n";
  }

  {
      # hashref for data
      my $data = { id => 1, name => 'foo', password => 'secret' };
      my $columns = [qw/id name/];
      my $table = to_table($data, $columns);
      print $table->render, "\n"; # qw/Key Value/ are set as header columns
  }

=head1 EXPORT

NONE

=head1 EXPORT_OK

to_table

=head1 AUTHOR

Yoshihiro Sasaki, E<lt>ysasaki at cpan.org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Yoshihiro Sasaki

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
