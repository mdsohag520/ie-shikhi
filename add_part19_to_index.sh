#!/data/data/com.termux/files/usr/bin/bash

FILE="index.html"
cp "$FILE" "$FILE.part19bak"

if grep -q "part-19.html" "$FILE"; then
  echo "ℹ️ Part 19 আগেই আছে"
else
  sed -i 's|file:"part-18.html"}|file:"part-18.html"},\n    {n:19, t:"Process, Capacity, Utilization ও Efficiency", d:"Man Capacity, Machine Capacity, Utilization, Efficiency, Formula", k:"process capacity utilization efficiency man machine formula", ready:true, file:"part-19.html"}|' "$FILE"
  echo "✅ Part 19 index.html এ যোগ হয়েছে"
fi

echo ""
echo "চেক করো:"
echo "Part 18 আছে: $(grep -c 'part-18.html' "$FILE")"
echo "Part 19 আছে: $(grep -c 'part-19.html' "$FILE")"
echo "ready:true মোট: $(grep -c 'ready:true' "$FILE")"
