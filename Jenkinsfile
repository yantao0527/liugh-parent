node("docker") {
    docker.withRegistry('http://registry.cn-hangzhou.aliyuncs.com', 'docker') {

        git branch: 'master', url: "git@github.com:yantao0527/liugh-parent.git", credentialsId: 'git-yantao'

        sh "git rev-parse HEAD > .git/commit-id"
        def commit_id = readFile('.git/commit-id').trim()
        println commit_id

        stage "build"
        sh "./mvnpkg.sh"
        def app = docker.build "yantao0527/restful"

        stage "publish"
        app.push "${commit_id}"
        app.push 'master'

        stage "deploy"
        sh "docker rm -f restful || true"
        app.run '--name restful --network nginx -v restful-tmp:/tmp'
    }
}
