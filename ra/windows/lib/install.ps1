if(!(test-path $profile)) {
	$profile_dir = split-path $profile
	if(!(test-path $profile_dir)) { mkdir $profile_dir > $null }
	'' > $profile
}

$text = gc $profile
if(($text | sls 'ra init') -eq $null) {
  write-host 'Adding ra to your powershell profile'

  # read and write whole profile to avoid problems with line endings and encodings
  $new_profile = @($text) + "try { `$null = ra init } catch { }"
  $new_profile > $profile
}
