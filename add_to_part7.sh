#!/data/data/com.termux/files/usr/bin/bash

FILE="part-7.html"
BACKUP="part-7.html.backup5"

# ব্যাকআপ
cp "$FILE" "$BACKUP"

# নতুন কনটেন্ট
NEW='<!-- DOWNTIME Section -->
<section class="topic" id="t3b">
<h2>3.1 DOWNTIME — ৮ Waste মনে রাখার সহজ উপায়</h2>
<p>৭ Waste এর সাথে <b class="term">Non-utilized Talent</b> যোগ করলে হয় <b class="term">৮ Waste</b>। মনে রাখার সহজ acronym <b class="term">DOWNTIME</b>:</p>
<div class="scroll"><table>
<tr><th>অক্ষর</th><th>Waste</th><th>অর্থ</th></tr>
<tr><td><b>D</b></td><td>Defects</td><td>ত্রুটি ও Rework</td></tr>
<tr><td><b>O</b></td><td>Overproduction</td><td>প্রয়োজনের আগে বা বেশি উৎপাদন</td></tr>
<tr><td><b>W</b></td><td>Waiting</td><td>অপেক্ষা</td></tr>
<tr><td><b>N</b></td><td>Non-utilized Talent</td><td>কর্মীর অব্যবহৃত দক্ষতা</td></tr>
<tr><td><b>T</b></td><td>Transportation</td><td>অপ্রয়োজনীয় নেওয়া-আনা</td></tr>
<tr><td><b>I</b></td><td>Inventory</td><td>বেশি মজুদ ও WIP</td></tr>
<tr><td><b>M</b></td><td>Motion</td><td>অপ্রয়োজনীয় নড়াচড়া</td></tr>
<tr><td><b>E</b></td><td>Extra-processing</td><td>প্রয়োজনের চেয়ে বেশি কাজ</td></tr>
</table></div>
<div class="note ok"><strong>✅ মনে রাখো:</strong> TIMWOOD ও DOWNTIME — দুটোই একই Waste এর ভিন্ন নাম।</div>
</section>

<!-- 6S Section -->
<section class="topic" id="t4b">
<h2>4.1 6S — 5S এর সাথে Safety</h2>
<p>5S এর সাথে <b class="term">Safety</b> যোগ করলে হয় <b class="term">6S</b>। নিরাপত্তা ছাড়া 5S অর্থহীন।</p>
<div class="scroll"><table>
<tr><th>6S</th><th>অর্থ</th><th>কাজ</th><th>Example</th></tr>
<tr><td>1. Seiri</td><td>Sort</td><td>বাছাই</td><td>বাতিল Leather সরানো</td></tr>
<tr><td>2. Seiton</td><td>Set in Order</td><td>সাজানো</td><td>Shadow Board</td></tr>
<tr><td>3. Seiso</td><td>Shine</td><td>পরিষ্কার</td><td>Skiving ধুলো সরানো</td></tr>
<tr><td>4. Seiketsu</td><td>Standardize</td><td>নিয়ম</td><td>Checklist</td></tr>
<tr><td>5. Shitsuke</td><td>Sustain</td><td>ধরে রাখা</td><td>Audit, স্বীকৃতি</td></tr>
<tr class="total"><td>6. Safety</td><td>নিরাপত্তা</td><td>ঝুঁকি প্রতিরোধ</td><td>Guard, Fire Exit, PPE</td></tr>
</table></div>
</section>

<!-- 4M/5M/6M/7M Section -->
<section class="topic" id="t5b">
<h2>5.1 4M, 5M, 6M, 7M — Cause-Effect Framework</h2>
<p>Fishbone ডায়াগ্রামে সমস্যার কারণ বিশ্লেষণে এই Framework ব্যবহার হয়।</p>
<div class="scroll"><table>
<tr><th>Framework</th><th>উপাদান</th></tr>
<tr><td><b>4M</b></td><td>Man, Machine, Material, Method</td></tr>
<tr><td><b>5M</b></td><td>4M + Measurement</td></tr>
<tr><td><b>6M</b></td><td>5M + Mother Nature (Environment)</td></tr>
<tr><td><b>7M</b></td><td>6M + Management (বা Money)</td></tr>
</table></div>
<h3>প্রতিটা M এর Example</h3>
<div class="scroll"><table>
<tr><th>M</th><th>অর্থ</th><th>Example</th></tr>
<tr><td><b>Man</b></td><td>লোক</td><td>Operator এর দক্ষতা, Training</td></tr>
<tr><td><b>Machine</b></td><td>যন্ত্র</td><td>Needle ভোঁতা, Machine Setting</td></tr>
<tr><td><b>Material</b></td><td>কাঁচামাল</td><td>Leather মান, Thread ভুল</td></tr>
<tr><td><b>Method</b></td><td>পদ্ধতি</td><td>Standard নেই, Jig নেই</td></tr>
<tr><td><b>Measurement</b></td><td>মাপ</td><td>ভুল মাপ, SMV ভুল</td></tr>
<tr><td><b>Mother Nature</b></td><td>পরিবেশ</td><td>আলো কম, ধুলো, শব্দ</td></tr>
<tr><td><b>Management</b></td><td>ব্যবস্থাপনা</td><td>Target বেশি, Planning দুর্বল</td></tr>
</table></div>
<div class="note ok"><strong>✅ মনে রাখো:</strong> 4M দিয়ে শুরু করো, দরকার হলে 5M, 6M, 7M এ যাও।</div>
</section>
'

# `5. Kaizen ও PDCA` এর ঠিক আগে সেকশনগুলো বসাও
awk -v new="$NEW" '
/5\. Kaizen/ && !done {
  print new
  done=1
}
{ print }
' "$FILE" > new_part7.html

mv new_part7.html "$FILE"

echo "🎉 Part 7 আপডেট সফল!"
echo "চেক করো:"
grep -c "DOWNTIME" part-7.html
grep -c "6S" part-7.html
grep -c "4M" part-7.html
