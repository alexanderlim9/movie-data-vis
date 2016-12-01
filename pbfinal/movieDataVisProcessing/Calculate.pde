

static class Calculate {
  
  Calculate() {
  }
  
  HashMap<Integer, Integer> moviesByYear(Table movies) {
    HashMap<Integer, Integer> result = new HashMap<Integer, Integer>();
    for (TableRow row : movies.rows()) {
      if (result.get(row.getInt("year")) == null) {
        result.put(row.getInt("year"), 1);
      } else {
        result.put(row.getInt("year"), result.get(row.getInt("year"))+1);
      }
    }
    return result;
  }
  
  
  
  
  }