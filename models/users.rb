require 'bcrypt'

def find_one_user_by_id(id)
    sql = ("select * from users where user_id = $1;")
    run_sql(sql, [id])[0]
end

def find_one_user_by_email(email)
    sql = ("select * from users where email = $1;")
    run_sql(sql, [email])[0]
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

def delete_all_articles_by_user_id(id)
sql = "delete from articles where user_id = $1;"
    run_sql(sql, [id])
end

def id_of_creator?(id)
    session[:id] == article["user_id"]
end


