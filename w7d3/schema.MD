Bandcamp

User:
id integer not null, primary key
email string not null, index, unique
password_digest string not null
session_token not null, index, unique
created_at datatime not null
updated_at datatime not null

index on username, unique: true
index on session_token, unique: true



Artist:
id integer not null, primary key
user_id integer not null, index, foreign key
band_name string not null
description text
created_at datatime not null
updated_at datatime not null

user_id references user
index on artist_id



Album:
id integer not null, primary key
artist_id integer not null, foreign key
title string not null
description text
created_at datatime not null
updated_at datatime not null

index on title
index on artist_id
artist_id references user



Songs:
id integer not null, primary key
title string not null
album_id integer not null foreign key
created_at datatime not null
updated_at datatime not null

index on title
album_id references album



Follows:
id integer not null, primary key
user_id integer not null, foreign key
artist_id integer not null, foreign key
created_at datatime not null
updated_at datatime not null

user_id references user
artist_id references artist



Wishlist:
id integer not null, primary key
user_id integer not null, foreign key
album_id integer not null, foreign key
created_at datatime not null
updated_at datatime not null

user_id references user
album_id references album


Shopping Cart:
id integer not null, primary key
user_id integer not null, foreign key
song_id integer foreign key
album_id integer foreign key
created_at datatime not null
updated_at datatime not null

user_id references user
album_id references album
song_id references song
