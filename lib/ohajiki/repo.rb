# coding: utf-8
require 'grit'

module Ohajiki
  class Repo
    class << self
      def exist?(dir_path)
        File.exist? File.join(dir_path, '.git')
      end

      def init(dir_path, &block)
        Grit::Repo.init(dir_path)
        repo = self.new dir_path
        repo.instance_eval &block 
        repo
      end
    end

    def initialize(dir_path)
      @dir_path = dir_path
      in_dir do
        @repo = Grit::Repo.new('.')
        @git = Grit::Git.new('./.git')
      end
    end

    def in_dir(&block)
      Dir.chdir(File.expand_path(@dir_path, __FILE__)) do
        block.call
      end
    end

    def remote_add(name, url)
      @repo.remote_add(name, url)
    end

    def latest?
      remote_head_id == local_head_id
    end

    def pull!
      in_dir do
        @git.native('pull', {}, 'origin', 'master')
      end
    end

    def reset_hard_head!
      in_dir do
        @git.native('reset', {:hard => true}, 'HEAD')
      end
    end

    def remote_head_id
      in_dir do
        h = @git.native('ls-remote', {}, 'origin', 'HEAD')
        h.empty? ? '' : h.split("\t")[0].strip
      end
    end

    def local_head_id
      in_dir do
        @git.native('rev-parse', {}, 'HEAD').strip
      end
    end

    def push!
      in_dir do
        @git.native('push', {:raise => true}, 'origin', 'master') 
      end
    end

    def add_stage! 
      in_dir do
        @repo.add('.')
      end
    end

    def commit_all!
      in_dir do
        @repo.commit_all("#{changed_count} files updated")
      end
    end

    def file_changed?
      changed_count > 0
    end

    def file_added?
      added_count > 0
    end

    def changed_count
      in_dir do
        @repo.status.select { |file|
          file.untracked || ['A', 'M', 'D'].include?(file.type)
        }.size 
      end
    end

    def added_count
      in_dir do
        @repo.status.select { |file|
          file.untracked
        }.size
      end
    end
  end
end
