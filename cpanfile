requires 'perl', '5.008001';
requires 'Furl';
requires 'URI';
requires 'JSON';
requires 'IO::Socket::SSL';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

