$in = Get-Content -Path '.\input.txt'
$pattern = "mul\((\d+),(\d+)\)"
$valid = [regex]::Matches($in, $pattern)
$results = 0

foreach ($match in $valid) {
  $left = [int]$match.Groups[1].Value
  $right = [int]$match.Groups[2].Value
  $result = $left * $right
  $results += $result
}

Write-Output $results
