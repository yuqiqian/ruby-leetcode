SELECT Score, Rank FROM(
    SELECT Score, @curRank := @curRank + IF(@prevScore = Score, 0, 1) AS Rank,
    @prevScore := Score
    FROM Scores s, (SELECT @curRank := 0) r, (SELECT @prevScore:=NULL) p
    ORDER BY Score DESC
)t;