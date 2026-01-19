{ ... }:

{
  services.cliphist =
  {
    enable = true;
    extraOptions =
    [
      "max-items" "100"
      "db-path" "/tmp/cliphist/db"
    ];
  };
}