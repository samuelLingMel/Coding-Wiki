require 'bcrypt'

def find_one_user_by_id(id)
    sql = ("select * from users where user_id = $1;")
    records = run_sql(sql, [id])
    if records.count == 0
        return nil
    else
        return records[0]
    end
end

def find_one_user_by_email(email)
    sql = ("select * from users where email = $1;")
    records = run_sql(sql, [email])
    if records.count == 0
        return nil
    else
        return records[0]
    end
end

def create_user(email, password, username)
    password_digest = BCrypt::Password.create(password)
    sql = "insert into users (email, password_digest, username) values ($1, $2, $3);"
    run_sql(sql, [email, password_digest, username])
end

def logged_in?()
    if session[:user_id] 
        true
    else
        false
    end
end

def delete_user(id)
    sql = "delete from users where id = $1;"
    run_sql(sql, [id])
end

def delete_all_articles_by_user_id(user_id)
sql = "delete from articles where user_id = $1;"
    run_sql(sql, [user_id])
end

def id_of_creator?(id)
    session[:id] == article["user_id"]
end

def update_user(email, password, username)
    password_digest = BCrypt::Password.create(password)
    sql = "update users set email = $1 password_digest = $2 username = $3 where user_id = $4;"
    run_sql(sql, [email, password_digest, username])
end

