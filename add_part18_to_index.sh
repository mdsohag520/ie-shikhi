#!/data/data/com.termux/files/usr/bin/bash

FILE="index.html"

# Part 17 এর পরে Part 18 যোগ করো
if grep -q "part-18.html" "$FILE"; then
  echo "ℹ️ Part 18 আগেই আছে"
else
  # শেষ part-17 লাইনের পরে নতুন লাইন যোগ
  sed -i 's|{n:17, t:"IE-এর Ethics, Leadership ও Politics".*ready:true, file:"part-17.html"}|&\n    {n:18, t:"Ventura-Specific IE (IM Division)", d:"Yamazumi, Layout, TMIS, TPM, Data Management", k:"ventura im division yamazumi layout tmis tpm data management", ready:true, file:"part-18.html"}|' "$FILE"
  echo "✅ Part 18 index.html এ যোগ হয়েছে"
fi

echo ""
echo "চেক করো:"
grep -c "part-18.html" "$FILE"
