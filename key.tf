# resource "tls_private_key" "key" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }

# resource "local_file" "linuxKey" {
#   content = tls_private_key.key.private_key_pem
#   filename          =   "key"    // pathexpand("~/stark/Downloads")
#   file_permission   = "0600"
# }

