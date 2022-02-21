module TableHelper
  def table columns:, rows:
    content_tag :table do
      thead(columns) + tbody
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

      # content_tag :tr do
      #   content_tag :th, "header col 1"
      # end
    # end
  # end

  def tbody
    content_tag :tbody do
      tr1 = content_tag :tr do
        content_tag :td, "body col 1"
      end
      tr2 = content_tag :tr do
        content_tag :td, "body col 1 row 2"
      end
      tr1 + tr2
    end
  end
end
