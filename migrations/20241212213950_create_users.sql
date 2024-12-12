CREATE TABLE users (
                       user_id TEXT PRIMARY KEY,
                       username TEXT NOT NULL UNIQUE,
                       email TEXT NOT NULL UNIQUE,
                       password_hash TEXT NOT NULL,
                       bio TEXT,
                       image TEXT,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_users_timestamp
    AFTER UPDATE ON users
BEGIN
    UPDATE users SET updated_at = CURRENT_TIMESTAMP
    WHERE user_id = NEW.user_id;
END;