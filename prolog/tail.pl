% --- Calls evaluate_match/3 and adds Source ---
evaluate_match(Candidate, Required, Strength, Source) :-
    evaluate_match(Candidate, Required, Strength),
    (
        Strength = exact_match ->
            Source = Required
    ;
        Strength = no_match ->
            Source = no_match
    ;
        % transferable case
        has_skill(Candidate, Known),
        transferable_skill(Known, Required, Strength),
        Source = Known
    ).

% --- Simplified version of effective_match_score/3 without experience_level/3 ---
skill_score(Candidate, Skill, Score) :-
    evaluate_match(Candidate, Skill, MatchStrength, _Source),
    match_strength_rank(MatchStrength, Score).

% --- Helper: take first N elements ---
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Rest]) :-
    N1 is N - 1,
    take(N1, T, Rest).

% --- Calculates max possible score with full exact matches ---
max_possible_score(Max) :-
    findall(Req, required_skill(Req), Reqs),
    length(Reqs, Count),
    match_strength_rank(exact_match, W),
    Max is Count * W.

% --- Collect breakdown of scores for each required skill ---
match_breakdown(Candidate, Breakdown, TotalScore) :-
    findall(skill(Required, Source, MatchStrength),
        ( required_skill(Required),
          evaluate_match(Candidate, Required, MatchStrength, Source)
        ),
        Breakdown),
    % Convert strengths to numeric scores for total
    findall(Score,
        ( member(skill(_, _, Strength), Breakdown),
          match_strength_rank(Strength, Score)
        ),
        Scores),
    sum_list(Scores, TotalScore).

% --- Gets N candidates with breakdown scores ---
top_applicants_breakdown(N, TopList) :-
    setof(Candidate, Skill^has_skill(Candidate, Skill), Candidates),
    findall(candidate(Candidate, PercentRounded, Breakdown),
        ( member(Candidate, Candidates),
          match_breakdown(Candidate, Breakdown, TotalScore),
          max_possible_score(Max),
          Percent is (TotalScore / Max) * 100,
          PercentRounded is round(Percent * 100) / 100 ),
        Scored),
    sort(Scored, Ascending),
    reverse(Ascending, Descending),
    take(N, Descending, TopList).