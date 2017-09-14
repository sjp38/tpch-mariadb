#!/usr/bin/env python

import os
import sys

sys.path.append(os.environ['HOME'] + '/lazybox/scripts/gen_report')
import ltldat

if len(sys.argv) < 2:
    print "Usage: %s <files>" % sys.argv[0]
    exit(1)

text = "TPCH\n\n\n"
for path in sys.argv[1:]:
    text += path + "\n"
    with open(path, 'r') as f:
        for line in f:
            line = line.replace(':', '')
            text += line
    text += "\n\n"
print text

print ltldat.from_human_readable_txt(text).human_readable_txt()
