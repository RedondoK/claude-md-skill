#!/bin/bash
# Script to organize repository by moving working files to roadwork directory

cd "$(dirname "$0")"

# Move PHASE documents
mv PHASE_0_RESEARCH.md roadwork/ 2>/dev/null
mv PHASE_2_CHECKLIST.md roadwork/ 2>/dev/null
mv PHASE_2_COMPLETE.md roadwork/ 2>/dev/null
mv PHASE_2_SUMMARY.md roadwork/ 2>/dev/null
mv PHASE_3_ACTUAL_RESULTS.md roadwork/ 2>/dev/null
mv PHASE_3_CHECKLIST_FINAL.md roadwork/ 2>/dev/null
mv PHASE_3_COMPLETE.md roadwork/ 2>/dev/null
mv PHASE_3_COMPLETE_PREPARATION.md roadwork/ 2>/dev/null
mv PHASE_3_COMPLETION.md roadwork/ 2>/dev/null
mv PHASE_3_EXECUTION.md roadwork/ 2>/dev/null
mv PHASE_3_INDEX.md roadwork/ 2>/dev/null
mv PHASE_3_PRE_TEST_ANALYSIS.md roadwork/ 2>/dev/null
mv PHASE_3_QUICK_FIX.md roadwork/ 2>/dev/null
mv PHASE_3_READY.md roadwork/ 2>/dev/null
mv PHASE_3_SUCCESS_SUMMARY.md roadwork/ 2>/dev/null
mv PHASE_3_SUMMARY.md roadwork/ 2>/dev/null
mv PHASE_3_TEST_GUIDE.md roadwork/ 2>/dev/null
mv PHASE_3_VISUAL_SUMMARY.md roadwork/ 2>/dev/null
mv PHASE_4_COMPLETE.md roadwork/ 2>/dev/null
mv PHASE_5_COMPLETE.md roadwork/ 2>/dev/null
mv PHASE_6_COMPLETE.md roadwork/ 2>/dev/null

# Move feedback and analysis files
mv AI_FEEDBACK_COMPARISON.md roadwork/ 2>/dev/null
mv FINAL_ACTION_GUIDE.md roadwork/ 2>/dev/null
mv GEMINI_FEEDBACK_ANALYSIS.md roadwork/ 2>/dev/null
mv GROK_FEEDBACK_ANALYSIS.md roadwork/ 2>/dev/null
mv MANUS_FEEDBACK_ANALYSIS.md roadwork/ 2>/dev/null

# Move markdownlint fix files
mv MARKDOWNLINT_FIX_COMPLETE.md roadwork/ 2>/dev/null
mv MARKDOWNLINT_FIX_GUIDE.md roadwork/ 2>/dev/null
mv MARKDOWNLINT_VIOLATIONS_FIXED.md roadwork/ 2>/dev/null
mv NBSP_ENHANCEMENT_COMPLETE.md roadwork/ 2>/dev/null

# Move status and action files
mv NEXT_STEPS.md roadwork/ 2>/dev/null
mv QUICK_FIX_COMMANDS.md roadwork/ 2>/dev/null
mv STATUS_REPORT.md roadwork/ 2>/dev/null
mv WHAT_TO_DO_NOW.md roadwork/ 2>/dev/null

# Move version-specific files
mv v1.1.2_ACTION_GUIDE.md roadwork/ 2>/dev/null
mv v1.1.2_FIX_SUMMARY.md roadwork/ 2>/dev/null

# Move working directory
mv phase6 roadwork/ 2>/dev/null

# Move shell scripts used for fixing
mv fix_md_errors.sh roadwork/ 2>/dev/null
mv quick_fix_violations.sh roadwork/ 2>/dev/null
mv test_nbsp_methods.sh roadwork/ 2>/dev/null

echo "Repository organization complete!"
echo "All working files moved to roadwork/ directory"
