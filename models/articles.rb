
def run_sql(sql, params = [])
    conn = PG.connect(ENV['DATABASE_URL'] || {dbname: 'coding_summary'})
    records = conn.exec_params(sql, params)
    conn.close
    return records
end

def all_articles()
    sql = "select * from articles order;"
    run_sql(sql)
end

def find_all_articles_by_user_id(user_id)
    sql = "select * from articles where user_id = $1"
    records = run_sql(sql, [user_id])
    if records.count == 0
        return nil
    else
        return records
    end
end

def find_one_article_by_id(id)
    sql = "select * from articles where id = $1;"
    run_sql(sql, [id])[0]
end

def find_one_article_by_user_id_and_title(user_id, title)
    sql = "select * from articles where user_id = $1 and title = $2;"
    run_sql(sql, [user_id, title])[0]
end 

def edit_article(id, title, body, diagram_url )
    sql = "update articles set title = $2, body = $3, diagram_url = $4 where id = $1;"
    run_sql(sql, [id, title, body, diagram_url ])
end

def create_article(title, body, diagram_url, user_id)
    sql = "insert into articles (title, body, diagram_url, user_id) values ($1, $2, $3, $4);"
    run_sql(sql, [title, body, diagram_url, user_id])
end

def delete_article(id)
    sql = "delete from articles where id = $1"
    run_sql(sql, [id])
end



