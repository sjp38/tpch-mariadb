#!/usr/bin/env python

import os
import sys

sys.path.append(os.environ['HOME'] + '/lazybox/scripts/gen_report')
import ltldat

text = ""
for l in sys.stdin:
    text += l
print ltldat.from_human_readable_txt(text).human_readable_txt()
