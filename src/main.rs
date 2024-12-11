use sqlx::sqlite::SqlitePool;

#[tokio::main]
async fn main() -> Result<(), sqlx::Error> {
    let database_url = "sqlite:realworld.db";

    let pool = SqlitePool::connect(database_url).await?;

    let row: (i64,) = sqlx::query_as("SELECT 1")
        .fetch_one(&pool)
        .await?;

    println!("connected database": {}", row.0);

    Ok(())
}
