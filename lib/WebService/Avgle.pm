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
       _base_uri => "https://api.avgle.com",
       _agent    => Furl->new( agent => "$agent"),
   };

    return bless $self,$class;
}

sub get_categories {
    my ($self, %args) = @_;

    my $param = {
        path        => '/v1/categories',
        die_message => "Avgle video categories",
    };

    my $req = $self->_get_req($param);

    return $req->{"categories"};
}

sub _get_req {
    my ($self,$args) = @_;

    my $uri = URI->new($self->{_base_uri});
    $uri->path($args->{"path"});

    my $res = $self->{_agent}->get($uri->as_string);

    unless ( $res->is_success ){
        return croak "Can't get $args->{die_message}";
    }

    return $self->_decode_res(+{
        res         => $res->content,
        die_message => $args->{die_message},
    });
}

sub _decode_res {
    my ($self,$args) = @_;

    my $hash_res = {};

    eval{
       $hash_res = decode_json($args->{res});
    };
    if($@){
        return croak "Can't decode $args->{die_message}";
    }

    if( $hash_res->{success} ){
        return $hash_res->{response};
    } else {
        return croak "Can't get $args->{die_message}";
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

WebService::Avglje is Avgle webservice module.
Avgle is porn site that  provide api.


=head1 INTERFACE

=head2 Class Methods

    WebService::Avgle->new;

Common ones new methods.

=head2 Instacnce Methods

=head3 get_categories

=head1 LICENSE

Copyright (C) AnaTofuZ.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

AnaTofuZ E<lt>anatofuz@gmail.comE<gt>

=cut

