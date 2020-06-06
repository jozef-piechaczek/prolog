merge(IN1, IN2, OUT) :-
    freeze(IN1,
        freeze(IN2,
            (IN1 = [E1 | T1]
                ->  (IN2 = [E2 | T2]
                    ->  (E1 =< E2
                        ->  OUT = [E1 | OUT_NEW],
                            merge(T1, IN2, OUT_NEW)
                        ;   OUT = [E2 | OUT_NEW],
                            merge(IN1, T2, OUT_NEW)
                        )
                    ;   OUT = IN1
                    )
                ;   OUT = IN2
            )
        )
    ).
