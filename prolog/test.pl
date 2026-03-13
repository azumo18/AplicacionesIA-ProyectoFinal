% --- Match weights ---
match_weight(exact_match, 4).
match_weight(strong_partial_match, 3).
match_weight(moderate_partial_match, 2).
match_weight(weak_partial_match, 1).
match_weight(no_match, 0).

% --- Score for one required skill ---
skill_score(Candidate, RequiredSkill, Score) :-
    has_skill(Candidate, RequiredSkill),
    match_weight(exact_match, Score).

skill_score(Candidate, RequiredSkill, Score) :-
    has_experience(Candidate, RequiredSkill),
    match_weight(exact_match, Score).

skill_score(Candidate, RequiredSkill, Score) :-
    has_skill(Candidate, Known),
    transferable_skill(Known, RequiredSkill, Strength),
    match_weight(Strength, Score).

skill_score(_, _, 0).  % fallback if no match

% --- Aggregate score for candidate ---
match_score(Candidate, TotalScore) :-
    setof(Candidate, Skill^has_skill(Candidate, Skill), Candidates),
    member(Candidate, Candidates),
    findall(Score,
        (required_skill(Req), skill_score(Candidate, Req, Score)),
        Scores),
    sum_list(Scores, TotalScore).

% --- Top N candidates ---
top_applicants(N, TopList) :-
    findall(Score-Candidate, match_score(Candidate, Score), Scored),
    sort(Scored, Ascending),
    reverse(Ascending, Descending),
    take(N, Descending, TopList).

% --- Helper: take first N elements ---
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Rest]) :-
    N1 is N - 1,
    take(N1, T, Rest).

max_possible_score(Max) :-
    findall(Req, required_skill(Req), Reqs),
    length(Reqs, Count),
    match_weight(exact_match, W),
    Max is Count * W.

match_percentage(Candidate, Percent) :-
    match_score(Candidate, Score),
    max_possible_score(Max),
    Percent is (Score / Max) * 100.

top_applicants_percent(N, TopList) :-
    findall(Percent-Candidate, match_percentage(Candidate, Percent), Scored),
    sort(Scored, Ascending),
    reverse(Ascending, Descending),
    take(N, Descending, TopList).

% --- Candidate test data ---
has_skill(alice, java).
has_skill(alice, html).
has_skill(alice, css).
has_skill(bob, sql).
has_skill(bob, python).
has_skill(carol, javascript).
has_skill(carol, sql).
has_skill(carol, css).
has_skill(carol, html).