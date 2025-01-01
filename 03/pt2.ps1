# Read the input file
$content = Get-Content -Path "input.txt" -Raw

$enabled = $true
$sum = 0
$position = 0

while ($position -lt $content.Length) {
  # Check for do() instruction
  if ($content.Substring($position).StartsWith("do()")) {
    $enabled = $true
    $position += 4  # Length of 'do()'
    continue
  }
    
  # Check for don't() instruction
  if ($content.Substring($position).StartsWith("don't()")) {
    $enabled = $false
    $position += 7  # Length of 'don't()'
    continue
  }
    
  # Check for multiplication instruction
  # Note: handles mul(x,y), mul[x,y], mul{x,y} with various closing brackets
  if ($content.Substring($position) -match '^mul\((\d+),(\d+)\)') {
    if ($enabled) {
      $left = [int]$matches[1]
      $right = [int]$matches[2]
      $sum += $left * $right
    }
    $position += $matches[0].Length
    continue
  }
    
  # Move to next character if no matches
  $position++
}

Write-Host "Total: $sum"
