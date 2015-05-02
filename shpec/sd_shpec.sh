source $SHPEC_ROOT/../sd

describe "sd"
  sdd="$HOME/.sdd"
  describe "adding a shift point"
    it "creates a symlink"
      sd add test_point &> /dev/null
      assert file_present "$sdd/test_point"
      rm "$sdd/test_point"
    end

    it "handles paths with spaces"
      path_with_spaces="/tmp/file with spaces/"
      mkdir -p "$path_with_spaces" && cd "$path_with_spaces"
      sd add spaces &> /dev/null
      saved_point="$(sd spaces && pwd)"
      rm "$sdd/spaces"
      rmdir "$path_with_spaces"

      assert equal "$saved_point" "$(pwd)"
    end
  end

  describe "removing a shift point"
    it "removes a symlink"
      sd add test_point &> /dev/null
      sd rm test_point &> /dev/null
      rm "$sdd/test_point" &> /dev/null

      assert file_absent $HOME/.sdd/test_point
    end
  end

  describe "shifting to a point"
    it "changes your working directory"
      cd /tmp
      sd add test_point &> /dev/null
      cd - &> /dev/null
      shifted_pwd="$(sd test_point && pwd)"
      rm "$sdd/test_point"

      assert equal "$shifted_pwd" "/tmp"
    end

    it "changes to the previous working directory"
      expected_wd=$(pwd)
      cd /tmp && sd - &> /dev/null
      assert equal "$expected_wd" "$(pwd)"
    end

    it "allows subfolders"
      cd /tmp
      mkdir subfolder
      sd add test_point &> /dev/null
      cd - &> /dev/null

      shifted_pwd="$(sd test_point/subfolder && pwd)"
      rm "$sdd/test_point"
      rmdir /tmp/subfolder

      assert equal "$shifted_pwd" "/tmp/subfolder"
      cd
    end
  end

  describe "listing your shift points"
    it "lists points with spaces"
      path_with_spaces="/tmp/file with spaces/"
      mkdir -p "$path_with_spaces" && cd "$path_with_spaces"
      sd add spaces &> /dev/null

      assert match "$(sd ls | grep spaces)" "file\ with\ spaces"
      rm "$sdd/spaces"
      rmdir "$path_with_spaces"
    end
  end
end
