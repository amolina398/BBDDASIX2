function prepare()
    local i
    print ("Creant la taula de prova...")
    db_query("CREATE TABLE prova (id1 INT UNSIGNED PRIMARY KEY, id2 INT)")
    db_query("BEGIN")
    print("Inserint dades....")
    for i=1, 1000 do
        db_query("INSERT INTO prova VALUES (" .. i .. "," .. i .. ")")
    end
    db_query("COMMIT")
    print ("dades inserides correctament")
end

function cleanup()
    print("Esborrant taula...")
    db_query("DROP table prova")
    print("Taula esborrada correctament")
end

function event()
    db_query("BEGIN")
    for i=1, 1000 do
        db_query("SELECT * FROM prova WHERE id1=" .. i)
        -- una altra opció: db_query("SELECT id1, id2 FROM prova WHERE id1 = " .. sb_rand(1, 1000))
    end
    db_query("COMMIT")
end
