- Users (_table_)
  - `id` (_column_): integer, **primary key**
  - `name`: string
  - `age`: integer
- Posts
  - `id`: integer, **primary key**
  - `poster_id`: integer, **foreign key** referencing the column `id` in Users.
  - `body`: string
- Likes
  - `id`: integer, **primary key**
  - `liker_id`: integer, **foreign key** referencing the column `id` in Users
  - `post_id`: integer, **foreign key** referencing the column `id` in Posts.
- Comments
  - `id`: integer, **primary key**
  - `commenter_id`: integer, **foreign key** referencing the column `id` in Users.
  - `post_id`: integer, **foreign key** referencing the column `id` in Posts.
  - `body`: string
- Albums
  - `id`: integer, **primary key**
  - `user_id`: integer, **foreign key** referencing the column `id` in Users
- Pictures
  - `id`: integer, **primary key**
  - `album_id`: integer, **foreign key** referencing the column `id` in Albums
  - `url`: string


Details:

- Users can create many Posts and Albums. They can also create Likes and Comments on Posts. Therefore, all of these tables have a direct relationship to Users via some kind of `user_id` column.
- Posts can have many Comments and Likes.
- Comments and Likes are connected to both the Users table and the Posts table. This is because, even though Posts are made by one user, a comment could be made by a different user.
- Albums contain many Pictures, but each Picture isn't associated with a User - they are associated with an Album, which is then associated with a User. This is because only the user who created the Album can add a Picture to it. Therefore, a `user_id` column in Pictures would be redundant.
