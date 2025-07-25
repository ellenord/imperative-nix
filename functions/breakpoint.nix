{
  execSh,
  ...
}:
message: toString (execSh "read && echo '\"$\"'")
