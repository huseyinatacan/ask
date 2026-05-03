output: codebase.txt quality.md perf.md security.md perf.sum.md security.sum.md quality.sum.md concatenated.md refined.md action.plan.md


quality.md: codebase.txt
	cat codebase.txt | ask "Review this text for readability, structure, and duplication; give exactly 5–7 concise bullets in “Problem → Fix” format only, no extra comments or rewriting:"  > quality.md
quality.sum.md: quality.md
	cat quality.md | ask "Compress the following output to exactly 5 concise bullets, keep only actionable items, no extra commentary:" > quality.sum.md


perf.md : codebase.txt
	cat codebase.txt | ask "Analyze this text/system for bottlenecks and inefficiencies; give exactly 5–7 concise bullets in “Issue → Optimization” format only, no extra comments:" > perf.md
perf.sum.md: perf.md
	cat perf.md | ask "Compress the following output to exactly 5 concise bullets, keep only actionable items, no extra commentary:" > perf.sum.md


security.md : codebase.txt
	cat codebase.txt | ask "Analyze this text/system for vulnerabilities and unsafe patterns; give exactly 5–7 concise bullets in “Risk → Mitigation” format only, no extra comments:" > security.md
security.sum.md: security.md
	cat security.md | ask "Compress the following output to exactly 5 concise bullets, keep only actionable items, no extra commentary:" > security.sum.md


concatenated.md : quality.sum.md perf.sum.md security.sum.md
	( echo "## Code Quality" && cat quality.sum.md  && echo "## Performance" && cat perf.sum.md  && echo "## Security" && cat security.sum.md )  > concatenated.md
refined.md: concatenated.md
	cat concatenated.md | ask "Analyze the input for quality, performance, and security; for each category, provide exactly 5 high-signal, actionable bullets in 'Problem → Solution' format, consolidated into a single markdown response with category headers." > refined.md

action.plan.md: refined.md
	cat refined.md | ask "Using the input categories, generate an 'Engineering Action Plan' that lists every task with a priority High/Medium/Low, an effort estimate Small/Medium/Large, and a sequential execution order, grouped into logical implementation phases." > action.plan.md


clean:
	rm -f quality.md perf.md security.md quality.sum.md perf.sum.md security.sum.md concatenated.md action.plan.md refined.md