
latex-checker: latex-checker.cpp
	g++ -std=c++0x -O3 -DNDEBUG latex-checker.cpp -o latex-checker
