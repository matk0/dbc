module TableHelper
  def table columns:, rows:
    content_tag :table, class: "table table-striped" do
      thead(columns) + tbody(rows)
    end
  end

  def thead columns
    content_tag :thead do
      content_tag :tr do
        safe_join(columns.collect do |column|
            content_tag :th, column
        end)
      end
    end
  end

  def tbody rows
    content_tag :tbody do
      safe_join(rows.collect do |row|
        content_tag :tr do
          safe_join(row.collect do |r|
            content_tag :td, r
          end)
        end
      end)
    end
  end
end
