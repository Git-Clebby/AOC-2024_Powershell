$in = Get-Content -Path '.\input.txt'
#$pattern = "mul\(\d+,\d+\)"
#$matchers = ($in | Select-String -Pattern $pattern -AllMatches).Matches.Value
$pattern = "mul\((\d+),(\d+)\)"
$matchers = [regex]::Matches($in, $pattern)
$results = 0

foreach ($match in $matchers) {
  $other = $match.Groups[0].Value
  Write-Host $other
  $left = [int]$match.Groups[1].Value
  $right = [int]$match.Groups[2].Value
  $result = $left * $right
  $results += $result
}

Write-Output $results
