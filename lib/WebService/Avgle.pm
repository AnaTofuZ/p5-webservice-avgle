package WebService::Avgle;
use 5.008001;
use strict;
use warnings;
use utf8;

use Furl;
use URI;
use Encode;
use JSON;

use Carp qw/croak/;

our $VERSION = "0.01";


sub new {
   my ($class, %args) = @_;

   my $agent = delete $args{agent} || "WebServie::Avgle agent $VERSION";

   my $self = {
       base_uri => "https://api.avgle.com",
       agent    => Furl->new( agent => "$agent"),
   };

    return bless $self,$class;
}

sub get_categories {
    my ($self, %args) = @_;

    my $uri = URI->new($self->{base_uri});
    $uri->path("/v1/categories");

    my $res = $self->{agent}->get($uri);

    unless ( $res->is_success ){
        croak "Don't get Avgle video categories";
    }

    my $pear_hash_data = {};

    eval{
       $pear_hash_data = decode_json($res->content);
    };
    if($@){
        croak "Can't decode Avgle video categories";
    }

    if( $pear_hash_data->{success} ){
        return $pear_hash_data->{response}->{categories};
    } else {
        croak "Can't get Avgle video categories";
    }
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Avgle - API Client for Avgle

=head1 SYNOPSIS

    use WebService::Avgle;
    my $avgle = WebService::Avgle->new;

=head1 DESCRIPTION

WebService::Avgle is ...

=head1 LICENSE

Copyright (C) AnaTofuZ.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

AnaTofuZ E<lt>anatofuz@gmail.comE<gt>

=cut

