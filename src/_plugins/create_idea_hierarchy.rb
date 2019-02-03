module IdeaHierarchy
  class Generator < Jekyll::Generator
    def generate(site)
      categories = site.data["categories"]
      ideas = site.collections["ideas"]

      # TODO: Check that every idea is used exactly once.
      site.data["idea_categories"] = categories.map { |category|
        category["ideas"] = ideas
          .select { |idea| idea.data["category"] == category["id"] }
          .sort_by { |idea| idea["title"] }
        category
      }
    end
  end
end
