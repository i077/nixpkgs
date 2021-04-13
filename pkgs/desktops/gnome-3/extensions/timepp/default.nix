{ lib, stdenv, fetchFromGitHub, gnome3 }:

stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-timepp";
  version = "unstable-2021-03-27";

  src = fetchFromGitHub {
    owner = "zagortenay333";
    repo = "timepp__gnome";
    rev = "23f387de21aeddf823e4c746b1971b1759c8f5d2";
    sha256 = "0mk805rf492fw7v2icilbn7rc2kc3qgfahp6pzjqppnj9sif5fcy";
  };

  uuid = "timepp@zagortenay333";
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/gnome-shell/extensions/${uuid}
    cp -r . $out/share/gnome-shell/extensions/${uuid}
    runHook postInstall
  '';

  meta = with lib; {
    description = "A todo.txt manager, time tracker, timer, stopwatch, pomodoro, and alarms gnome-shell extension.";
    homepage = "https://github.com/zagortenay333/timepp__gnome";
    license = licenses.gpl3;
    maintainers = with maintainers; [ svsdep ];
  };
}
