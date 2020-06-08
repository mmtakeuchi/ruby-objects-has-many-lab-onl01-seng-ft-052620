class Author
    attr_accessor :name
    def initialize(name)
        @name = name
        @posts = []
    end

    def posts
        Post.all.select {|post| post.author == self}
    end

    def add_post(post)
        @posts << post
        post.author = self
    end

    def add_post_by_title(title)
        title = Post.new(title)
        title.author = self
    end

    def self.post_count
        Post.all.map {|post| post.author == self}.count
    end
end