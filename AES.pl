use strict;
use warnings;
use Crypt::CBC;

# Set the encryption key and IV
my $key = 'your_secret_key_here';
my $iv = 'your_initialization_vector_here';

# Create a new CBC object
my $cipher = Crypt::CBC->new(
    -key    => $key,
    -cipher => 'AES',
    -iv     => $iv
);

# Encrypt some data
my $data = 'AZ09(!@#$%^&*)-=_+=-';
my $encrypted = $cipher->encrypt($data);
print "Encrypted: $encrypted\n";

# Decrypt the data
my $decrypted = $cipher->decrypt($encrypted);
print "Decrypted: $decrypted\n";
