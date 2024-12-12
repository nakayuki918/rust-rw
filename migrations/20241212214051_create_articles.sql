-- migrations/XXXXXXXXXXXXXX_create_articles.up.sql
CREATE TABLE articles (
                          article_id TEXT PRIMARY KEY,
                          slug TEXT NOT NULL UNIQUE,
                          title TEXT NOT NULL,
                          description TEXT NOT NULL,
                          body TEXT NOT NULL,
                          author_id TEXT NOT NULL,
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                          updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                          FOREIGN KEY (author_id) REFERENCES users(user_id)
);

CREATE TABLE tags (
                      tag_id TEXT PRIMARY KEY,
                      name TEXT NOT NULL UNIQUE
);

CREATE TABLE article_tags (
                              article_id TEXT NOT NULL,
                              tag_id TEXT NOT NULL,
                              PRIMARY KEY (article_id, tag_id),
                              FOREIGN KEY (article_id) REFERENCES articles(article_id) ON DELETE CASCADE,
                              FOREIGN KEY (tag_id) REFERENCES tags(tag_id) ON DELETE CASCADE
);

CREATE TRIGGER update_articles_timestamp
    AFTER UPDATE ON articles
BEGIN
    UPDATE articles SET updated_at = CURRENT_TIMESTAMP
    WHERE article_id = NEW.article_id;
END;